	.syntax unified
	.set sub_801183C, 0x0801183C + 1
	.set sub_8011D78, 0x08011D78 + 1
	.section .text.sub_8010834, "ax", %progbits
@ Event3A_DisplayPopup @ JP 0x08010834 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event3A_DisplayPopup
	.thumb_func
Event3A_DisplayPopup:
	push {r4, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08010848
	movs r0, #0
	b _08010888
_08010848:
	ldr r1, [r3, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	movs r4, #2
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bge _0801085E
	ldr r0, _08010868 @ =0x030004B0
	movs r4, #8
	ldrsh r0, [r0, r4]
_0801085E:
	cmp r2, #0
	beq _0801086C
	cmp r2, #1
	beq _08010876
	b _08010886
	.align 2, 0
_08010868: .4byte 0x030004B0
_0801086C:
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	bl sub_801183C
	b _08010886
_08010876:
	ldrh r2, [r1, #6]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x10
	asrs r2, r2, #0x18
	bl sub_8011D78
_08010886:
	movs r0, #2
_08010888:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

