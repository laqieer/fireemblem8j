	.syntax unified
	.set LinkArenaBattleMap_ClearCmdBuffer, 0x0804A138 + 1
	.set sub_8042678, 0x08042678 + 1
	.section .text.sub_804A14C, "ax", %progbits
@ sub_804A14C @ JP 0x0804A14C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A14C
	.thumb_func
sub_804A14C:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	bl LinkArenaBattleMap_ClearCmdBuffer
	ldr r1, _0804A188 @ =0x0300182C
	strb r4, [r1]
	strb r5, [r1, #1]
	strb r6, [r1, #2]
	ldr r0, [sp]
	strb r0, [r1, #3]
	ldr r0, _0804A18C @ =0x0203DA20
	ldrb r0, [r0]
	cmp r0, #2
	beq _0804A190
	movs r0, #0
	b _0804A19C
	.align 2, 0
_0804A188: .4byte 0x0300182C
_0804A18C: .4byte 0x0203DA20
_0804A190:
	adds r0, r1, #0
	movs r1, #4
	bl sub_8042678
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0804A19C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

