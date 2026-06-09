	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8071084, "ax", %progbits
@ sub_8071084 @ JP 0x08071084 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071084
	.thumb_func
sub_8071084:
	push {r4, lr}
	adds r4, r1, #0
	bl sub_8070F08
	ldrh r1, [r0, #0xc]
	lsls r1, r1, #5
	ldr r0, _080710A8 @ =0x020228A8
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl sub_80D636C
	bl sub_8001EE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080710A8: .4byte 0x020228A8

