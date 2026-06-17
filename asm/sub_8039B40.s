	.syntax unified
	.set WriteSuspendSave, 0x080AA460 + 1
	.section .text.CpDecide_Suspend, "ax", %progbits
@ CpDecide_Suspend @ JP 0x08039B40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CpDecide_Suspend
	.thumb_func
CpDecide_Suspend:
	push {lr}
	ldr r0, _08039B5C @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08039B64
	ldr r1, _08039B60 @ =0x0203A954
	movs r0, #3
	b _08039B68
	.align 2, 0
_08039B5C: .4byte 0x03004DF0
_08039B60: .4byte 0x0203A954
_08039B64:
	ldr r1, _08039B74 @ =0x0203A954
	movs r0, #2
_08039B68:
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r0}
	bx r0
	.align 2, 0
_08039B74: .4byte 0x0203A954

