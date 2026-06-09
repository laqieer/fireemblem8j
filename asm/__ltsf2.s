	.syntax unified
	.set __fpcmp_parts_f, 0x080DBC9C + 1
	.set __unpack_f, 0x080DB7F4 + 1
	.section .text.__ltsf2, "ax", %progbits
@ __ltsf2 @ JP 0x080DBEC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __ltsf2
	.thumb_func
__ltsf2:
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080DBEEC
	movs r1, #1
_080DBEEC:
	cmp r1, #0
	bne _080DBEFE
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _080DBEFA
	movs r1, #1
_080DBEFA:
	cmp r1, #0
	beq _080DBF02
_080DBEFE:
	movs r0, #1
	b _080DBF0A
_080DBF02:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_080DBF0A:
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0

