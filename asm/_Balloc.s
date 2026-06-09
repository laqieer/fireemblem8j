	.syntax unified
	.set sub_80DA85C, 0x080DA85C + 1
	.section .text._Balloc, "ax", %progbits
@ _Balloc @ JP 0x080D9968 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _Balloc
	.thumb_func
_Balloc:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _080D9984
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x10
	bl sub_80DA85C
	str r0, [r4, #0x4c]
	cmp r0, #0
	beq _080D99AC
_080D9984:
	ldr r1, [r4, #0x4c]
	lsls r0, r6, #2
	adds r2, r0, r1
	ldr r1, [r2]
	cmp r1, #0
	beq _080D9996
	ldr r0, [r1]
	str r0, [r2]
	b _080D99B4
_080D9996:
	movs r5, #1
	lsls r5, r6
	lsls r2, r5, #2
	adds r2, #0x14
	adds r0, r4, #0
	movs r1, #1
	bl sub_80DA85C
	adds r1, r0, #0
	cmp r1, #0
	bne _080D99B0
_080D99AC:
	movs r0, #0
	b _080D99BC
_080D99B0:
	str r6, [r1, #4]
	str r5, [r1, #8]
_080D99B4:
	movs r0, #0
	str r0, [r1, #0x10]
	str r0, [r1, #0xc]
	adds r0, r1, #0
_080D99BC:
	pop {r4, r5, r6, pc}
	.align 2, 0

