	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80710AC, 0x080710AC + 1
	.set sub_80710DC, 0x080710DC + 1
	.section .text.sub_8071A70, "ax", %progbits
@ sub_8071A70 @ JP 0x08071A70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071A70
	.thumb_func
sub_8071A70:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08071A9C @ =0x0865A280
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, [r4, #0x5c]
	ldr r1, _08071AA0 @ =0x08659FFC
	bl sub_80710DC
	ldr r0, [r4, #0x5c]
	ldr r1, _08071AA4 @ =0x08659404
	bl sub_80710AC
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071A9C: .4byte 0x0865A280
_08071AA0: .4byte 0x08659FFC
_08071AA4: .4byte 0x08659404

