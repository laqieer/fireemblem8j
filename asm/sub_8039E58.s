	.syntax unified
	.set AiExecFallbackScriptA, 0x0803C4A0 + 1
	.set AiTryExecScriptA, 0x0803C44C + 1
	.set sub_803D374, 0x0803D374 + 1
	.section .text.sub_8039E58, "ax", %progbits
@ DecideScriptA @ JP 0x08039E58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DecideScriptA
	.thumb_func
DecideScriptA:
	push {r4, lr}
	movs r4, #0
	ldr r0, _08039E80 @ =0x03004DF0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _08039E9E
	cmp r0, #0x34
	beq _08039E9E
	ldr r0, _08039E84 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08039E88
	bl sub_803D374
	b _08039E9E
	.align 2, 0
_08039E80: .4byte 0x03004DF0
_08039E84: .4byte 0x0203AA00
_08039E88:
	bl AiTryExecScriptA
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08039E9E
	adds r4, #1
	cmp r4, #0xff
	ble _08039E88
	bl AiExecFallbackScriptA
_08039E9E:
	pop {r4}
	pop {r0}
	bx r0

