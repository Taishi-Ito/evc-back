class Project < ApplicationRecord
  has_many :capital_investment, dependent: :destroy
  has_many :pl, dependent: :destroy
  has_many :bst, dependent: :destroy
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
    create_pl uid
    create_pl_record
    create_bst uid
    create_bst_record
    create_cf uid
    create_cf_record
  end

  private
  def create_capital_investment uid
    CapitalInvestment.create!(project_id: self.id, title: "新しいモデル", unit: "yen", fixed: 0, created_by: uid, edited_by: uid, sequence: [])
  end

  def create_capital_investment_record
    new_capital_investment = CapitalInvestment.find_by(project_id: self.id)
    new_capital_investment_record = CapitalInvestmentRecord.create!(
      capital_investment_id: new_capital_investment.id,
      year: 0, month: 0, existing_facilities: 0, new_facilities: 0, d_existing_facilities: 0, d_new_facilities: 0, d_year: 0
    )
    new_capital_investment.sequence << new_capital_investment_record.id
    new_capital_investment.save!
  end

  def create_pl uid
    Pl.create!(project_id: self.id, title: "新しいモデル", unit: "yen", fixed: 0, created_by: uid, edited_by: uid, sequence: [])
  end

  def create_pl_record
    new_pl = Pl.find_by(project_id: self.id)
    new_pl_record = PlRecord.create!(
      pl_id: new_pl.id,
      year: 0, month: 0, customer: 0, av_customer_spend: 0, sales_cost: 0 , sales_cost_ratio: 0, labor_cost: 0, cost_other: 0,
      no_op_income: 0, interest_expense: 0, interest_rate: 0, other: 0, tax: 0, tax_rate: 0
    )
    new_pl.sequence << new_pl_record.id
    new_pl.save!
  end

  def create_bst uid
    Bst.create!(project_id: self.id, title: "新しいモデル", unit: "yen", fixed: 0, created_by: uid, edited_by: uid, sequence: [])
  end

  def create_bst_record
    new_bst = Bst.find_by(project_id: self.id)
    new_bst_record = BstRecord.create!(
      bst_id: new_bst.id,
      year: 0, month: 0, cash: 0, accounts_receivable: 0, ar_sales_ratio: 0, merchandise_other: 0, mo_sales_ratio: 0, land_buildings: 0,
      investment_other: 0, accounts_payable: 0, cost_ratio: 0, cd_other: 0, long_term_debt: 0, fl_other: 0, capital: 0, surplus: 0
    )
    new_bst.sequence << new_bst_record.id
    new_bst.save!
  end

  def create_cf uid
    Cf.create!(project_id: self.id, title: "新しいモデル", unit: "yen", fixed: 0, created_by: uid, edited_by: uid, sequence: [])
  end

  def create_cf_record
    new_cf = Cf.find_by(project_id: self.id)
    new_cf_record = CfRecord.create!(
      bst_id: new_bst.id, year: 0, month: 0
    )
    new_cf.sequence << new_cf_record.id
    new_cf.save!
  end
end
