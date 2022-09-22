class ReportsController < ApplicationController

  def unit_report
    data = {}
    reports = UnitReport.where(year: params[:year])
    data[params[:year]] = reports.map do |report|
       report_data(report)
    end

    render json: data.to_json
  end

  private

  def report_data(report)
    {
      category: report.category.name,
      april: report.april,
      may: report.may,
      june: report.june,
      july: report.july,
      august: report.august,
      september: report.september,
      october: report.october,
      november: report.november,
      december: report.december,
      january: report.january,
      february: report.february,
      march: report.march,
      year_total: report.year_total,
      year_average: report.year_average,
      year_target: report.year_target
    }
  end
end
