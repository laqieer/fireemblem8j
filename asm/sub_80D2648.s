	.syntax unified
	.set SetCgTextFlags, 0x08090CAC + 1
	.set sub_80913FC, 0x080913FC + 1
	.section .text.sub_80D2648, "ax", %progbits
@ PromoTrainee_Talk4 @ JP 0x080D2648 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PromoTrainee_Talk4
	.thumb_func
PromoTrainee_Talk4:
	push {r4, r5, lr}
	sub sp, #0x1c
	add r2, sp, #0x10
	ldr r1, _080D2664 @ =0x081F6D50
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldrh r0, [r0, #0x2a]
	cmp r0, #0x12
	beq _080D2668
	cmp r0, #0x12
	ble _080D2670
	cmp r0, #0x18
	beq _080D266C
	b _080D2670
	.align 2, 0
_080D2664: .4byte 0x081F6D50
_080D2668:
	movs r0, #1
	b _080D2672
_080D266C:
	movs r0, #2
	b _080D2672
_080D2670:
	movs r0, #0
_080D2672:
	lsls r0, r0, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _080D26A4 @ =0x06011800
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
_080D26A4: .4byte 0x06011800

