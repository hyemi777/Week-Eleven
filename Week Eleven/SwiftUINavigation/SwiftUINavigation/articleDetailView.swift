//
//  articleDetailView.swift
//  SwiftUINavigation
//
//  Created by Hyemi Byun on 3/30/21.
//

import SwiftUI

struct articleDetailView: View {
    var article: Article
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Group{
                    Text(article.title)
                        .font(.system(.title, design:.rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
            
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action:{
                self.presentationMode.wrappedValue.dismiss()
            },label: {
                Image(systemName:"chevron.left.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            })
        )
    }
}

struct articleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            articleDetailView(article: articles[0])
        }
    }
}
