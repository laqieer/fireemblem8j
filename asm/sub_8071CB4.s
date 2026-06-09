	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F10, 0x08070F10 + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_8071CB4, "ax", %progbits
@ sub_8071CB4 @ JP 0x08071CB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071CB4
	.thumb_func
sub_8071CB4:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_8070F08
	adds r6, r0, #0
	ldr r0, _08071CF8 @ =0x08604144
	adds r1, r4, #0
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08071CFC @ =0x080E4D34
	str r0, [r4, #0x48]
	ldr r0, _08071D00 @ =0x086041BC
	str r0, [r4, #0x4c]
	ldr r0, _08071D04 @ =0x08604154
	str r0, [r4, #0x54]
	ldr r0, _08071D08 @ =0x08604224
	str r0, [r4, #0x58]
	ldr r0, [r6, #0x24]
	bl sub_80D65BC
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_8070F10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071CF8: .4byte 0x08604144
_08071CFC: .4byte 0x080E4D34
_08071D00: .4byte 0x086041BC
_08071D04: .4byte 0x08604154
_08071D08: .4byte 0x08604224

