	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_803E628, 0x0803E628 + 1
	.section .text.sub_803E5D0, "ax", %progbits
@ sub_803E5D0 @ JP 0x0803E5D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803E5D0
	.thumb_func
sub_803E5D0:
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _0803E620 @ =0x0202BCEC
	ldrb r2, [r0, #0xf]
	mov r1, sp
	ldr r0, _0803E624 @ =0x080DD35C
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	movs r5, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _0803E616
	adds r6, r1, #0
	adds r4, r2, #1
_0803E5F4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0803E60C
	ldr r0, [r1]
	cmp r0, #0
	beq _0803E60C
	adds r0, r1, #0
	bl sub_803E628
_0803E60C:
	adds r4, #1
	adds r5, #1
	ldr r0, [r6]
	cmp r5, r0
	blt _0803E5F4
_0803E616:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803E620: .4byte 0x0202BCEC
_0803E624: .4byte 0x080DD35C

