	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set StartOrphanMenu, 0x0804F970 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8005BA8, 0x08005BA8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_805082C, 0x0805082C + 1
	.section .text.sub_8024218, "ax", %progbits
@ sub_8024218 @ JP 0x08024218 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024218
	.thumb_func
sub_8024218:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, _080242A8 @ =0x0203A954
	ldrb r0, [r1, #2]
	strb r0, [r6, #0xd]
	bl sub_80034D0
	movs r0, #4
	bl sub_8003508
	ldr r0, _080242AC @ =0x085C5568
	bl StartOrphanMenu
	adds r0, r4, #0
	bl sub_805082C
	ldr r0, _080242B0 @ =0x0202352C
	ldr r1, _080242B4 @ =0x085C926C
	movs r2, #0x80
	lsls r2, r2, #5
	bl j_TmApplyTsa
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	bl sub_8003E0C
	movs r4, #0x38
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	ldr r5, _080242B8 @ =0x02022D6E
	movs r1, #7
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_8004374
	adds r5, #0x80
	ldrb r0, [r6, #0xd]
	bl GetUnit
	bl sub_8018FCC
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, #0
	movs r3, #5
	bl sub_8005BA8
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080242A8: .4byte 0x0203A954
_080242AC: .4byte 0x085C5568
_080242B0: .4byte 0x0202352C
_080242B4: .4byte 0x085C926C
_080242B8: .4byte 0x02022D6E

