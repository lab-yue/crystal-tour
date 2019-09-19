import React from "react";
import { css, Global } from "@emotion/core";
import styled from "@emotion/styled";

const Title = styled.h1`
  font-family: "Cute Font", cursive;
  color: hotpink;
  font-size: 6rem;
  text-align: center;
  width: 100%;
  text-shadow: 5px 5px 0 skyblue, 5px 5px 5px #9c27b0;
`;

export default function App() {
  return (
    <>
      <Global
        styles={css`
          body {
            margin: 0;
          }
          #app {
            height: 100vh;
            display: flex;
            align-items: center;
          }
        `}
      />
      <Title>Linker.moe</Title>
    </>
  );
}
