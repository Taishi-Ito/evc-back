class Project < ApplicationRecord
  has_many :capital_investment, dependent: :destroy
  belongs_to :work_group
  validates :title, presence: true

  def self.get_wg_pj_lists user_id
    work_groups = WorkGroup.where(user_id: user_id)
    wg_pj_lists = []
    work_groups.each do |work_group|
      wg_pj_list = {}
      projects = Project.where(work_group_id: work_group.id)
      wg_pj_list["workGroupTitle"] = {"title": work_group.title, "id": work_group.id}
      wg_pj_list["projectTitles"] = []
      projects.each do |project|
        project_set = {"title": project.title, "id": project.id}
        wg_pj_list["projectTitles"].push(project_set)
      end
      wg_pj_lists.push(wg_pj_list)
    end
    wg_pj_lists
  end

  def create_default_modelset uid
    create_capital_investment uid
    create_capital_investment_record
  end

  private
  def create_capital_investment uid
    capital_investment = CapitalInvestment.create!(project_id: self.id, title: "新しいモデル", unit: "yen", fixed: 0, created_by: uid, edited_by: uid, sequence: [])
  end

  def create_capital_investment_record
    new_capital_investment = CapitalInvestment.find_by(project_id: self.id)
    create_capital_investment_record = CapitalInvestmentRecord.create!(
      capital_investment_id: new_capital_investment.id,
      year: 0, month: 0, existing_facilities: 0, new_facilities: 0, d_existing_facilities: 0, d_new_facilities: 0, d_year: 0
    )
    new_capital_investment.sequence << create_capital_investment_record.id
    new_capital_investment.save!
  end
end
