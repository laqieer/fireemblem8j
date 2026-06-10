	.syntax unified
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_800A788, "ax", %progbits
@ sub_800A788 @ JP 0x0800A788 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800A788
	.thumb_func
sub_800A788:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r5, r4
	cmp r6, #0
	beq _0800A83A
	movs r0, #0x80
	lsls r0, r0, #5
	mov r8, r0
	cmp r6, r8
	ble _0800A7B8
	lsls r1, r5, #0xc
	adds r0, r6, #0
	bl sub_80D6378
	adds r5, r0, #0
	lsls r1, r4, #0xc
	adds r0, r6, #0
	bl sub_80D6378
	adds r4, r0, #0
_0800A7B8:
	movs r0, #0x80
	lsls r0, r0, #6
	subs r0, r0, r4
	subs r0, r0, r5
	movs r1, #0x80
	lsls r1, r1, #0x11
	bl sub_80D6378
	adds r6, r0, #0
	cmp r7, r5
	bge _0800A7F2
	cmp r5, #0
	bne _0800A7D4
	movs r5, #1
_0800A7D4:
	lsls r1, r6, #0xc
	adds r0, r5, #0
	bl sub_80D6378
	adds r1, r0, #0
	muls r1, r7, r1
	mov r0, r8
	bl sub_80D6378
	adds r1, r0, #0
	muls r1, r7, r1
	mov r0, r8
	bl sub_80D6378
	b _0800A83A
_0800A7F2:
	mov r1, r8
	subs r0, r1, r4
	cmp r7, r0
	bge _0800A810
	lsls r1, r7, #0xd
	mov r0, r8
	bl sub_80D6378
	subs r0, r0, r5
	adds r1, r6, #0
	muls r1, r0, r1
	mov r0, r8
	bl sub_80D6378
	b _0800A83A
_0800A810:
	mov r0, r8
	subs r7, r0, r7
	cmp r4, #0
	bne _0800A81A
	movs r4, #1
_0800A81A:
	lsls r1, r6, #0xc
	adds r0, r4, #0
	bl sub_80D6378
	adds r1, r0, #0
	muls r1, r7, r1
	mov r0, r8
	bl sub_80D6378
	adds r1, r0, #0
	muls r1, r7, r1
	mov r0, r8
	bl sub_80D6378
	mov r1, r8
	subs r0, r1, r0
_0800A83A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

