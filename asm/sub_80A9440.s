	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.section .text.sub_80A9440, "ax", %progbits
@ sub_80A9440 @ JP 0x080A9440 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9440
	.thumb_func
sub_80A9440:
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A9460
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A9460
	lsls r1, r4, #4
	ldr r0, _080A9468 @ =0x0203E880
	adds r0, r1, r0
	cmp r0, #0
	bne _080A946C
_080A9460:
	movs r0, #0x80
	lsls r0, r0, #6
	b _080A9472
	.align 2, 0
_080A9468: .4byte 0x0203E880
_080A946C:
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x16
_080A9472:
	pop {r4}
	pop {r1}
	bx r1

