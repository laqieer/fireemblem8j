	.syntax unified
	.set SetIRQHandler, 0x08000B50 + 1
	.section .text.sub_80418FC, "ax", %progbits
@ sub_80418FC @ JP 0x080418FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80418FC
	.thumb_func
sub_80418FC:
	push {lr}
	ldr r1, _08041940 @ =0x04000134
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0xc
	movs r0, #0
	strh r0, [r1]
	ldr r2, _08041944 @ =0x03004E18
	ldr r1, _08041948 @ =0x03004E14
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, _0804194C @ =0x03004EA8
	str r0, [r1]
	ldr r1, _08041950 @ =0x030017DC
	subs r0, #1
	str r0, [r1]
	movs r0, #7
	movs r1, #0
	bl SetIRQHandler
	movs r0, #6
	movs r1, #0
	bl SetIRQHandler
	ldr r2, _08041954 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08041958 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08041940: .4byte 0x04000134
_08041944: .4byte 0x03004E18
_08041948: .4byte 0x03004E14
_0804194C: .4byte 0x03004EA8
_08041950: .4byte 0x030017DC
_08041954: .4byte 0x04000200
_08041958: .4byte 0x0000FF3F

