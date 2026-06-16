	.syntax unified
	.set AiCanEquip, 0x0803E890 + 1
	.set AiEquipBestConsideringDanger, 0x0803EB80 + 1
	.set AiEquipGetFlags, 0x0803E8CC + 1
	.set sub_803E9E8, 0x0803E9E8 + 1
	.section .text.sub_803A748, "ax", %progbits
@ sub_803A748 @ JP 0x0803A748 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A748
	.thumb_func
sub_803A748:
	push {r4, r5, r6, lr}
	sub sp, #0x18
	bl AiCanEquip
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803A786
	add r0, sp, #4
	bl AiEquipGetFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803A786
	ldr r1, _0803A790 @ =0x0203AA90
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	add r4, sp, #0x10
	mov r5, sp
	adds r5, #0x12
	add r6, sp, #0x14
	str r6, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_803E9E8
	ldrh r0, [r4]
	ldrh r1, [r5]
	ldrh r2, [r6]
	add r3, sp, #4
	bl AiEquipBestConsideringDanger
_0803A786:
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A790: .4byte 0x0203AA90

