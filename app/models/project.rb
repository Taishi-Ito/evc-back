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
end
