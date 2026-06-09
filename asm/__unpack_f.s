	.syntax unified
	.section .text.__unpack_f, "ax", %progbits
@ __unpack_f @ JP 0x080DB7F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __unpack_f
	.thumb_func
__unpack_f:
	push {r4, lr}
	adds r3, r1, #0
	ldr r0, [r0]
	lsls r1, r0, #9
	lsrs r2, r1, #9
	lsls r1, r0, #1
	lsrs r1, r1, #0x18
	lsrs r0, r0, #0x1f
	str r0, [r3, #4]
	cmp r1, #0
	bne _080DB838
	cmp r2, #0
	bne _080DB814
	movs r0, #2
	str r0, [r3]
	b _080DB86C
_080DB814:
	adds r4, r1, #0
	subs r4, #0x7e
	str r4, [r3, #8]
	lsls r2, r2, #7
	movs r0, #3
	str r0, [r3]
	ldr r1, _080DB834 @ =0x3FFFFFFF
	cmp r2, r1
	bhi _080DB854
	adds r0, r4, #0
_080DB828:
	lsls r2, r2, #1
	subs r0, #1
	cmp r2, r1
	bls _080DB828
	str r0, [r3, #8]
	b _080DB854
	.align 2, 0
_080DB834: .4byte 0x3FFFFFFF
_080DB838:
	cmp r1, #0xff
	bne _080DB858
	cmp r2, #0
	bne _080DB846
	movs r0, #4
	str r0, [r3]
	b _080DB86C
_080DB846:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _080DB852
	movs r0, #1
_080DB852:
	str r0, [r3]
_080DB854:
	str r2, [r3, #0xc]
	b _080DB86C
_080DB858:
	adds r0, r1, #0
	subs r0, #0x7f
	str r0, [r3, #8]
	movs r0, #3
	str r0, [r3]
	lsls r0, r2, #7
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3, #0xc]
_080DB86C:
	pop {r4, pc}
	.align 2, 0

