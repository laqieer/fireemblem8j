	.syntax unified
	.section .text.sub_8005278, "ax", %progbits
@ sub_8005278 @ JP 0x08005278 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8005278
	.thumb_func
sub_8005278:
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r5, _080052A8 @ =0x030030E0
	lsls r0, r0, #4
	adds r4, r0, #3
	lsls r4, r4, #1
	adds r4, r4, r5
	strh r1, [r4]
	adds r1, r0, #7
	lsls r1, r1, #1
	adds r1, r1, r5
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xb
	lsls r1, r1, #1
	adds r1, r1, r5
	strh r3, [r1]
	adds r0, #0xf
	lsls r0, r0, #1
	adds r0, r0, r5
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080052A8: .4byte 0x030030E0

