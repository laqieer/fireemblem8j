	.syntax unified
	.section .text.sub_8084630, "ax", %progbits
@ sub_8084630 @ JP 0x08084630 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8084630
	.thumb_func
sub_8084630:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r4, #2
	ldr r0, _08084674 @ =0x080DC15C
	mov ip, r0
	movs r6, #0xff
	adds r1, r3, r1
	lsls r3, r3, #1
	movs r2, #0x9e
_0808464E:
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	asrs r0, r0, #0xc
	ldr r7, [sp, #0x14]
	adds r0, r0, r7
	strh r0, [r4]
	adds r4, #4
	adds r1, r1, r3
	subs r2, #2
	cmp r2, #0
	bge _0808464E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084674: .4byte 0x080DC15C

