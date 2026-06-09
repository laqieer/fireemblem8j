	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.section .text.sub_80A9740, "ax", %progbits
@ sub_80A9740 @ JP 0x080A9740 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9740
	.thumb_func
sub_80A9740:
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r4, #0x45
	bhi _080A9764
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A9764
	lsls r0, r4, #4
	ldr r1, _080A9760 @ =0x0203E880
	adds r0, r0, r1
	b _080A9766
	.align 2, 0
_080A9760: .4byte 0x0203E880
_080A9764:
	movs r0, #0
_080A9766:
	pop {r4}
	pop {r1}
	bx r1

