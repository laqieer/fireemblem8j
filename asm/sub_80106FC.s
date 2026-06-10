	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set SetPartyGoldAmount, 0x08024DB4 + 1
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_8011640, 0x08011640 + 1
	.set sub_8011730, 0x08011730 + 1
	.section .text.sub_80106FC, "ax", %progbits
@ sub_80106FC @ JP 0x080106FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80106FC
	.thumb_func
sub_80106FC:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x38]
	ldrb r0, [r1]
	movs r4, #0xf
	ands r4, r0
	adds r6, r4, #0
	movs r2, #2
	ldrsh r0, [r1, r2]
	bl sub_800BF3C
	adds r1, r0, #0
	cmp r1, #0
	bne _0801071C
	movs r0, #6
	b _08010766
_0801071C:
	cmp r4, #1
	beq _08010740
	cmp r4, #1
	bgt _0801072A
	cmp r4, #0
	beq _08010730
	b _08010764
_0801072A:
	cmp r6, #2
	beq _08010750
	b _08010764
_08010730:
	ldr r0, _0801073C @ =0x030004B0
	ldrh r2, [r0, #0xc]
	adds r0, r5, #0
	bl sub_8011640
	b _08010764
	.align 2, 0
_0801073C: .4byte 0x030004B0
_08010740:
	ldr r0, _0801074C @ =0x030004B0
	ldr r2, [r0, #0xc]
	adds r0, r5, #0
	bl sub_8011730
	b _08010764
	.align 2, 0
_0801074C: .4byte 0x030004B0
_08010750:
	bl GetPartyGoldAmount
	ldr r1, _0801076C @ =0x030004B0
	ldr r1, [r1, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	bge _08010760
	movs r0, #0
_08010760:
	bl SetPartyGoldAmount
_08010764:
	movs r0, #2
_08010766:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801076C: .4byte 0x030004B0

