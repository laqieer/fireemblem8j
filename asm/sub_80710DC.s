	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80710DC, "ax", %progbits
@ sub_80710DC @ JP 0x080710DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80710DC
	.thumb_func
sub_80710DC:
	push {r4, lr}
	adds r4, r1, #0
	bl sub_8070F08
	ldrh r1, [r0, #0x10]
	lsls r1, r1, #5
	ldr r0, _08071100 @ =0x02022AA8
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl sub_80D636C
	bl sub_8001EE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071100: .4byte 0x02022AA8

