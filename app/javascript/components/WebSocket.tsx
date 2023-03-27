import * as React from "react";
import * as ReactDOM from "react-dom";
import * as ReactDOMClient from 'react-dom/client';
import { BrowserRouter, Routes, Route, useParams } from "react-router-dom";
import consumer from "../channels/consumer";

function WebSocket() {
  const [messages, setMessages] = React.useState([]);
  const params = useParams();

  React.useEffect(() => {
    consumer.subscriptions.create(
      { channel: "SensorChannel", id: params.id ?? undefined },
      {
        received(data) {
          setMessages([...messages, data.message]);
        },
      }
    );
  }, [messages, setMessages, params]);

  return (
    <div>
      {messages.map((message: string, index: number) => (
        <p key={`message-${index}`}>{message}</p>
      ))}
    </div>
  );
}

function NotFound() {
  return <p>Not Found</p>;
}

document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("root");
  const root = ReactDOMClient.createRoot(container)
  root.render(
    <BrowserRouter>
      <Routes>
        <Route path="sensors" element={<WebSocket />}>
          <Route path=":id" element={<WebSocket />} />
        </Route>
        <Route path="*" element={<NotFound />} />
      </Routes>
    </BrowserRouter>
  );
});
