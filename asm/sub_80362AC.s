	.syntax unified
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_8035EDC, 0x08035EDC + 1
	.section .text.sub_80362AC, "ax", %progbits
@ sub_80362AC @ JP 0x080362AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80362AC
	.thumb_func
sub_80362AC:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r7, r0, #0
	ldr r5, _080362EC @ =0x0203A954
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r0, #0x30
	ldrb r4, [r0]
	lsls r4, r4, #0x1c
	lsrs r4, r4, #0x1c
	str r4, [r6, #0x58]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	subs r0, r4, #1
	cmp r0, #0xc
	bhi _08036336
	lsls r0, r0, #2
	ldr r1, _080362F0 @ =_080362F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080362EC: .4byte 0x0203A954
_080362F0: .4byte _080362F4
_080362F4: @ jump table
	.4byte _08036328 @ case 0
	.4byte _08036328 @ case 1
	.4byte _08036328 @ case 2
	.4byte _08036328 @ case 3
	.4byte _08036336 @ case 4
	.4byte _08036336 @ case 5
	.4byte _08036336 @ case 6
	.4byte _08036336 @ case 7
	.4byte _08036336 @ case 8
	.4byte _08036328 @ case 9
	.4byte _08036328 @ case 10
	.4byte _08036336 @ case 11
	.4byte _08036328 @ case 12
_08036328:
	movs r0, #2
	ldrsb r0, [r7, r0]
	bl GetUnit
	adds r1, r6, #0
	bl sub_8035EDC
_08036336:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

