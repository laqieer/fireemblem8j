	.syntax unified
	.set Text_Skip, 0x08003D88 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8003F98, 0x08003F98 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_800407C, "ax", %progbits
@ sub_800407C @ JP 0x0800407C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800407C
	.thumb_func
sub_800407C:
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0xff
	beq _0800408C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080040AC
_0800408C:
	movs r1, #8
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl Text_Skip
	ldr r0, _080040A8 @ =0x000004C5
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	b _080040B2
	.align 2, 0
_080040A8: .4byte 0x000004C5
_080040AC:
	adds r0, r4, #0
	bl sub_8003F98
_080040B2:
	pop {r4}
	pop {r0}
	bx r0

