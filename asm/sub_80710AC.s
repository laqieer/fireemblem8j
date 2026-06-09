	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_80710AC, "ax", %progbits
@ sub_80710AC @ JP 0x080710AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80710AC
	.thumb_func
sub_80710AC:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl sub_8070F08
	adds r5, r0, #0
	ldrh r4, [r5, #0xe]
	lsls r4, r4, #5
	ldr r0, _080710D8 @ =0x06010000
	adds r4, r4, r0
	ldr r1, [r5, #0x20]
	adds r0, r6, #0
	bl sub_80D6394
	ldr r0, [r5, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080710D8: .4byte 0x06010000

