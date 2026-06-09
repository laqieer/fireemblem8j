	.syntax unified
	.set sub_80BD55C, 0x080BD55C + 1
	.set sub_80BD824, 0x080BD824 + 1
	.set sub_80C8418, 0x080C8418 + 1
	.section .text.sub_80BECF8, "ax", %progbits
@ sub_80BECF8 @ JP 0x080BECF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BECF8
	.thumb_func
sub_80BECF8:
	push {lr}
	sub sp, #4
	bl sub_80BD824
	bl sub_80C8418
	bl sub_80BD55C
	mov r2, sp
	ldr r1, _080BED34 @ =0x03005270
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, #0x78
	lsls r0, r0, #8
	str r0, [r1, #8]
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #0x50
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BED34: .4byte 0x03005270

