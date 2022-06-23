//
//  NotificationSheetContentView.swift
//  HelpMySkin
//
//  Created by Lais Godinho on 23/06/22.
//

import SwiftUI
import StepperView

struct NotificationSheetContentView: View {
    let steps = [TextView(text:"Limpeza", font: .system(size: 14, weight: .semibold)),
                 TextView(text:"Hidratação", font: .system(size: 14, weight: .semibold)),
                 TextView(text:"Proteção solar", font: .system(size: 14, weight: .semibold))]
    let indicators = [
        StepperIndicationType.custom(Image(systemName:"1.circle")
            .font(.largeTitle)
            .foregroundColor(Color("CallToAction"))
            .eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"2.circle")
            .font(.largeTitle)
            .foregroundColor(Color("CallToAction"))
             .eraseToAnyView()),
        StepperIndicationType.custom(Image(systemName:"3.circle")
            .font(.largeTitle)
            .foregroundColor(Color("CallToAction"))
            .eraseToAnyView())
    ]
    let pitStopLineOptions = [
        StepperLineOptions.custom(1, Color("CallToAction")),
        StepperLineOptions.custom(1, Color("CallToAction")),
        StepperLineOptions.custom(1, Color("CallToAction"))
    ]
    let pitStops = [
        TextView(text:GithubPitstops.pitStop1).eraseToAnyView(),
        TextView(text:GithubPitstops.pitStop2).eraseToAnyView(),
        TextView(text:GithubPitstops.pitStop3).eraseToAnyView()
    ]
  let lifeCycles = [
    StepLifeCycle.completed,
    StepLifeCycle.completed,
    StepLifeCycle.pending
  ]
    var body: some View {
        ZStack {
          Color("Secondary")
            VStack {
                // swiftlint:disable line_length
                Image("sun")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                TextView(text: "Durante os dias quentes, há uma maior exposição ao sol e o nosso corpo produz mais suor, em busca da regularização da temperatura corporal. Usar muito hidratante pode obstruir os poros e causar espinhas, por isso a rotina deve ser adaptada. A oleosidade tende a aumentar.")
                    .padding()
                // swiftlint:enable line_length
                StepperView()
                    .addSteps(steps)
                    .indicators(indicators)
                    .stepIndicatorMode(StepperMode.vertical)
                    .addPitStops(pitStops)
                    .pitStopLineOptions(pitStopLineOptions)
                    .spacing(80)
                    .stepLifeCycles(lifeCycles)
                    .padding(.top)
                Spacer()
            }
            .padding(.init(top: 24, leading: 1, bottom: 1, trailing: 1))
        }
        .ignoresSafeArea()
    }
    struct GithubPitstops {
        static var pitStop1 =
      "Lavar o rosto 3 vezes por dia. Se no período da tarde não puder, aplicar água termal é uma boa opção."
        static var pitStop2 =
      "Lavar o rosto 3 vezes por dia. Se no período da tarde não puder, aplicar água termal é uma boa opção."
        static var pitStop3 =
      "Lavar o rosto 3 vezes por dia. Se no período da tarde não puder, aplicar água termal é uma boa opção."
    }
}

struct NotificationSheetContentView_Previews: PreviewProvider {
    static var previews: some View {
      NotificationSheetContentView()
    }
}
