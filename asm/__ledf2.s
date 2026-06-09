	.syntax unified
	.set __fpcmp_parts_d, 0x080DB2C4 + 1
	.set __unpack_d, 0x080DAAE8 + 1
	.section .text.__ledf2, "ax", %progbits
@ __ledf2 @ JP 0x080DB56C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __ledf2
	.thumb_func
__ledf2:
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080DB594
	movs r1, #1
_080DB594:
	cmp r1, #0
	bne _080DB5A6
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080DB5A2
	movs r1, #1
_080DB5A2:
	cmp r1, #0
	beq _080DB5AA
_080DB5A6:
	movs r0, #1
	b _080DB5B2
_080DB5AA:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_080DB5B2:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0

