	.syntax unified
	.set __lshrdi3, 0x080DC088 + 1
	.set __unpack_d, 0x080DAAE8 + 1
	.section .text.__fixdfsi, "ax", %progbits
@ __fixdfsi @ JP 0x080DB634 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __fixdfsi
	.thumb_func
__fixdfsi:
	push {lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #2
	bne _080DB64E
	movs r1, #1
_080DB64E:
	cmp r1, #0
	bne _080DB682
	movs r1, #0
	cmp r0, #1
	bhi _080DB65A
	movs r1, #1
_080DB65A:
	cmp r1, #0
	bne _080DB682
	movs r1, #0
	cmp r0, #4
	bne _080DB666
	movs r1, #1
_080DB666:
	cmp r1, #0
	beq _080DB67C
_080DB66A:
	ldr r0, [sp, #4]
	ldr r1, _080DB678 @ =0x7FFFFFFF
	cmp r0, #0
	beq _080DB6A0
	adds r1, #1
	b _080DB6A0
	.align 2, 0
_080DB678: .4byte 0x7FFFFFFF
_080DB67C:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _080DB686
_080DB682:
	movs r0, #0
	b _080DB6A2
_080DB686:
	cmp r0, #0x1e
	bgt _080DB66A
	movs r2, #0x3c
	subs r2, r2, r0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __lshrdi3
	adds r1, r0, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _080DB6A0
	rsbs r1, r1, #0
_080DB6A0:
	adds r0, r1, #0
_080DB6A2:
	add sp, #0x1c
	pop {pc}
	.align 2, 0

