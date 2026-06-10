	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80206D0, "ax", %progbits
@ sub_80206D0 @ JP 0x080206D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80206D0
	.thumb_func
sub_80206D0:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrb r1, [r4]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq _080206FC
	bl sub_8000CD8
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08020730
_080206FC:
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _0802070C
	ldrh r0, [r4]
	adds r0, #4
	b _08020710
_0802070C:
	ldrh r0, [r4]
	adds r0, #1
_08020710:
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #5
	ble _08020730
	movs r0, #1
	movs r1, #6
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r5, #0
	bl sub_8002DE4
_08020730:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

