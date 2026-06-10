	.syntax unified
	.set InsertMultiArenaRanking, 0x080458D0 + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_8047578, 0x08047578 + 1
	.set sub_804A85C, 0x0804A85C + 1
	.set sub_80AB3B8, 0x080AB3B8 + 1
	.set sub_80AB3F4, 0x080AB3F4 + 1
	.section .text.sub_8045A04, "ax", %progbits
@ sub_8045A04 @ JP 0x08045A04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045A04
	.thumb_func
sub_8045A04:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r1, _08045A70 @ =0x0203DA20
	adds r0, r1, #0
	adds r0, #0xec
	ldrb r5, [r0]
	lsls r5, r5, #0x1e
	lsrs r5, r5, #0x1f
	adds r1, #0xa0
	ldrb r6, [r1]
	subs r6, #1
	bl sub_804A85C
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08045A74 @ =0x0203DD8C
	ldr r0, _08045A78 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	mov sb, r0
	ldr r0, _08045A7C @ =0x0203DC40
	mov r8, r0
	bl sub_80AB3F4
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	mov r3, sb
	bl InsertMultiArenaRanking
	str r0, [r7, #0x58]
	mov r0, r8
	bl sub_80AB3B8
	ldr r1, [r7, #0x58]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08045A80
	adds r0, r1, #0
	adds r1, r7, #0
	bl sub_8047578
	b _08045A86
	.align 2, 0
_08045A70: .4byte 0x0203DA20
_08045A74: .4byte 0x0203DD8C
_08045A78: .4byte 0x085D31E8
_08045A7C: .4byte 0x0203DC40
_08045A80:
	movs r0, #1
	bl sub_800226C
_08045A86:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

