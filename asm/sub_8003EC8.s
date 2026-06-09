	.syntax unified
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8003F10, 0x08003F10 + 1
	.set sub_800A004, 0x0800A004 + 1
	.section .text.sub_8003EC8, "ax", %progbits
@ sub_8003EC8 @ JP 0x08003EC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003EC8
	.thumb_func
sub_8003EC8:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #0
	str r0, [r6]
	str r0, [r5]
	bl sub_800A004
	adds r4, r0, #0
	b _08003EDE
_08003EDC:
	adds r4, #1
_08003EDE:
	ldrb r0, [r4]
	cmp r0, #1
	bls _08003F08
	adds r0, r4, #0
	bl sub_8003E0C
	adds r1, r0, #0
	ldr r0, [r6]
	cmp r0, r1
	bge _08003EF4
	str r1, [r6]
_08003EF4:
	ldr r0, [r5]
	adds r0, #0x10
	str r0, [r5]
	adds r0, r4, #0
	bl sub_8003F10
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _08003EDC
_08003F08:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

