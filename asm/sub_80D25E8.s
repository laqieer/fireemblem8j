	.syntax unified
	.set SetCgTextFlags, 0x08090CAC + 1
	.set sub_80913FC, 0x080913FC + 1
	.section .text.sub_80D25E8, "ax", %progbits
@ PromoTrainee_Talk3 @ JP 0x080D25E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PromoTrainee_Talk3
	.thumb_func
PromoTrainee_Talk3:
	push {r4, r5, lr}
	sub sp, #0x1c
	add r2, sp, #0x10
	ldr r1, _080D2604 @ =0x081F6D44
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldrh r0, [r0, #0x2a]
	cmp r0, #0x12
	beq _080D2608
	cmp r0, #0x12
	ble _080D2610
	cmp r0, #0x18
	beq _080D260C
	b _080D2610
	.align 2, 0
_080D2604: .4byte 0x081F6D44
_080D2608:
	movs r0, #1
	b _080D2612
_080D260C:
	movs r0, #2
	b _080D2612
_080D2610:
	movs r0, #0
_080D2612:
	lsls r0, r0, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _080D2644 @ =0x06011800
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_80913FC
	movs r0, #0xa
	bl SetCgTextFlags
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2644: .4byte 0x06011800

