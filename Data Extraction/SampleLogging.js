import * as React from "react";

export class FeedbackDialogBox extends React.Component < {}, {} > {

  onButtonClicked = (event: any) => {
    // Log the click
    Analytics.trackClick({
      id: event.target.id
    });
  }

  render() {
    return ( <
      Button id = "button_id"
      onClick = {
        this.onButtonClicked
      }
      />
    );
  }
};