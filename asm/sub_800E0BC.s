	.syntax unified
	.set StartBgmVolumeChange, 0x08002680 + 1
	.set sub_800223C, 0x0800223C + 1
	.section .text.sub_800E0BC, "ax", %progbits
@ sub_800E0BC @ JP 0x0800E0BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E0BC
	.thumb_func
sub_800E0BC:
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x38]
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq _0800E0D2
	cmp r1, #1
	beq _0800E0F0
	b _0800E114
_0800E0D2:
	ldrh r0, [r3, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E0E2
	movs r0, #0
	b _0800E116
_0800E0E2:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
	b _0800E114
_0800E0F0:
	ldrh r0, [r3, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E108
	movs r0, #0x80
	lsls r0, r0, #1
	bl sub_800223C
	movs r0, #0
	b _0800E116
_0800E108:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
_0800E114:
	movs r0, #2
_0800E116:
	pop {r1}
	bx r1
	.align 2, 0

