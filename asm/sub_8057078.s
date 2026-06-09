	.syntax unified
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_8077EE8, 0x08077EE8 + 1
	.section .text.sub_8057078, "ax", %progbits
@ sub_8057078 @ JP 0x08057078 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8057078
	.thumb_func
sub_8057078:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0805709C @ =0x0203E0FA
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08057094
	bl GetBanimDragonStatusType
	cmp r0, #1
	blo _080570A0
	cmp r0, #2
	bhi _080570A0
_08057094:
	adds r0, r5, #0
	bl sub_8002DE4
	b _080570E8
	.align 2, 0
_0805709C: .4byte 0x0203E0FA
_080570A0:
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_8012E84
	adds r4, r0, #0
	ldr r0, _080570F0 @ =0x0203E0FA
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl sub_8077EE8
	ldr r0, _080570F4 @ =0x020228A8
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl sub_80737A4
	bl sub_8001EE4
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _080570E8
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_8002DE4
_080570E8:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080570F0: .4byte 0x0203E0FA
_080570F4: .4byte 0x020228A8

