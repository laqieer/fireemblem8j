	.syntax unified
	.set GetCameraCenteredX, 0x08015A5C + 1
	.set GetCameraCenteredY, 0x08015A88 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set sub_8033168, 0x08033168 + 1
	.set sub_807C44C, 0x0807C44C + 1
	.set sub_8085680, 0x08085680 + 1
	.set sub_80976FC, 0x080976FC + 1
	.set sub_8097C50, 0x08097C50 + 1
	.section .text.sub_80337D0, "ax", %progbits
@ sub_80337D0 @ JP 0x080337D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80337D0
	.thumb_func
sub_80337D0:
	push {r4, r5, lr}
	sub sp, #4
	bl sub_8033168
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _080337F8
	bl sub_8097C50
	cmp r0, #0
	beq _080337F8
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetCursorMapPosition
	b _0803382A
_080337F8:
	bl sub_8085680
	adds r4, r0, #0
	bl sub_80976FC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r4, r1
	mov r5, sp
	adds r5, #1
	adds r0, r4, #0
	mov r1, sp
	adds r2, r5, #0
	movs r3, #0
	bl sub_807C44C
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl SetCursorMapPosition
_0803382A:
	ldr r4, _0803384C @ =0x0202BCAC
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl GetCameraCenteredX
	strh r0, [r4, #0xc]
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl GetCameraCenteredY
	strh r0, [r4, #0xe]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803384C: .4byte 0x0202BCAC

