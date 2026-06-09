	.syntax unified
	.set FlipWorldMapHblankBuffer, 0x080C6B84 + 1
	.set GetWorldMapHblankBuffer, 0x080C6B5C + 1
	.set _DivArm2, 0x0800BB3C + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C513C, "ax", %progbits
@ sub_80C513C @ JP 0x080C513C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C513C
	.thumb_func
sub_80C513C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	movs r0, #0
	movs r1, #1
	bl GetWorldMapHblankBuffer
	mov sl, r0
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r2, #0
	bl _DivArm2
	movs r5, #0x80
	lsls r5, r5, #5
	lsls r4, r0, #7
	rsbs r4, r4, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80D6378
	adds r0, #0x80
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80D6378
	adds r0, #0x50
	lsls r0, r0, #0x10
	movs r6, #0
	adds r7, r5, #0
	mov r4, sl
	asrs r1, r0, #0x10
	mov r8, r1
	rsbs r5, r0, #0
_080C5190:
	cmp r6, sb
	blt _080C5198
	movs r0, #0
	b _080C51B4
_080C5198:
	cmp r6, r8
	blt _080C51B2
	asrs r0, r5, #0x10
	movs r1, #0x30
	movs r2, #0
	bl _DivArm2
	subs r0, r7, r0
	lsls r1, r0, #4
	adds r0, r7, #0
	bl sub_80D6378
	b _080C51B4
_080C51B2:
	movs r0, #0x10
_080C51B4:
	strh r0, [r4]
	adds r4, #2
	movs r2, #0x80
	lsls r2, r2, #9
	adds r5, r5, r2
	adds r6, #1
	cmp r6, #0x4f
	ble _080C5190
	mov r1, sl
	movs r0, #0x9f
	lsls r0, r0, #1
	adds r2, r1, r0
	movs r6, #0x4f
_080C51CE:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	subs r2, #2
	subs r6, #1
	cmp r6, #0
	bge _080C51CE
	bl FlipWorldMapHblankBuffer
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

