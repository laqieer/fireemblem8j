	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_804D14C, 0x0804D14C + 1
	.section .text.sub_804D18C, "ax", %progbits
@ sub_804D18C @ JP 0x0804D18C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D18C
	.thumb_func
sub_804D18C:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r5, [r0, #0x58]
	adds r0, r5, #0
	movs r1, #3
	bl __modsi3
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #6
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	lsls r5, r5, #0xb
	ldr r0, _0804D204 @ =0x085DAFC8
	mov r2, r8
	ldr r1, [r2, #0x5c]
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	bl sub_8013008
	ldr r0, _0804D208 @ =0x085D4EB0
	ldr r6, _0804D20C @ =0x02020188
	adds r1, r6, #0
	bl sub_8013008
	adds r4, r4, r5
	adds r4, r4, r6
	ldr r1, _0804D210 @ =0x06014000
	adds r0, r4, #0
	movs r2, #0xa
	movs r3, #2
	bl sub_804D14C
	ldr r0, _0804D214 @ =0x02023CA8
	ldr r1, _0804D218 @ =0x085DB10C
	mov r4, r8
	ldr r2, [r4, #0x5c]
	lsls r2, r2, #0xf
	lsrs r2, r2, #0x14
	movs r4, #0x80
	lsls r4, r4, #5
	adds r3, r4, #0
	orrs r2, r3
	bl j_TmApplyTsa
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D204: .4byte 0x085DAFC8
_0804D208: .4byte 0x085D4EB0
_0804D20C: .4byte 0x02020188
_0804D210: .4byte 0x06014000
_0804D214: .4byte 0x02023CA8
_0804D218: .4byte 0x085DB10C

