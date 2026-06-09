	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80C41F0, 0x080C41F0 + 1
	.set sub_80C5604, 0x080C5604 + 1
	.set sub_80C5628, 0x080C5628 + 1
	.section .text.sub_80BE4B8, "ax", %progbits
@ sub_80BE4B8 @ JP 0x080BE4B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE4B8
	.thumb_func
sub_80BE4B8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r0
	add r2, sp, #8
	lsls r1, r1, #5
	ldr r0, _080BE56C @ =0x081F5D7C
	adds r1, r1, r0
	ldrh r0, [r1, #0x18]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0x1a]
	strh r0, [r2]
	ldr r7, _080BE570 @ =0x03005270
	add r0, sp, #8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r7, #8]
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #8
	str r0, [r7, #0xc]
	add r0, sp, #8
	movs r4, #0
	ldrsh r0, [r0, r4]
	movs r3, #0
	ldrsh r1, [r2, r3]
	add r5, sp, #0xc
	mov r6, sp
	adds r6, #0xe
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_80C5628
	add r2, sp, #0x10
	ldrh r0, [r7, #2]
	strh r0, [r2]
	mov r1, sp
	adds r1, #0x12
	ldrh r0, [r7, #4]
	strh r0, [r1]
	movs r4, #0
	ldrsh r0, [r2, r4]
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r4, #0
	ldrsh r3, [r6, r4]
	movs r4, #4
	str r4, [sp]
	bl sub_80C5604
	cmp r0, #0
	bge _080BE52E
	ldr r1, _080BE574 @ =0x000001FF
	adds r0, r0, r1
_080BE52E:
	asrs r0, r0, #9
	adds r0, #6
	cmp r0, #0xa
	ble _080BE538
	movs r0, #0xa
_080BE538:
	movs r1, #1
	rsbs r1, r1, #0
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r4, #0
	ldrsh r3, [r6, r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r4, #0
	str r4, [sp, #4]
	adds r0, r1, #0
	bl sub_80C41F0
	strb r4, [r7, #1]
	mov r0, r8
	movs r1, #8
	bl Proc_Goto
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE56C: .4byte 0x081F5D7C
_080BE570: .4byte 0x03005270
_080BE574: .4byte 0x000001FF

