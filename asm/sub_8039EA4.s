	.syntax unified
	.set AiExecFallbackScriptB, 0x0803C530 + 1
	.set AiTryExecScriptB, 0x0803C4DC + 1
	.set sub_80379F4, 0x080379F4 + 1
	.set sub_803D394, 0x0803D394 + 1
	.section .text.sub_8039EA4, "ax", %progbits
@ sub_8039EA4 @ JP 0x08039EA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8039EA4
	.thumb_func
sub_8039EA4:
	push {r4, lr}
	movs r4, #0
	ldr r0, _08039EDC @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08039EC8
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_80379F4
	cmp r0, #0
	bne _08039EFA
_08039EC8:
	ldr r0, _08039EE0 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08039EE4
	bl sub_803D394
	b _08039EFA
	.align 2, 0
_08039EDC: .4byte 0x03004DF0
_08039EE0: .4byte 0x0203AA00
_08039EE4:
	bl AiTryExecScriptB
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08039EFA
	adds r4, #1
	cmp r4, #0xff
	ble _08039EE4
	bl AiExecFallbackScriptB
_08039EFA:
	pop {r4}
	pop {r0}
	bx r0

