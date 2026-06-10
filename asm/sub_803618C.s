	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_803618C, "ax", %progbits
@ sub_803618C @ JP 0x0803618C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803618C
	.thumb_func
sub_803618C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x34
	beq _080361B0
	movs r0, #0x34
	bl GetClassData
	str r0, [r4, #4]
	bl RefreshEntityBmMaps
	bl sub_8019914
	bl sub_8027144
	bl sub_807B4B8
_080361B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

