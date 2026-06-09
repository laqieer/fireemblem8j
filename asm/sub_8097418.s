	.syntax unified
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.section .text.sub_8097418, "ax", %progbits
@ sub_8097418 @ JP 0x08097418 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097418
	.thumb_func
sub_8097418:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r7, r1, #0
	mov sb, r2
	mov sl, r3
	ldr r1, _0809748C @ =0x08A96C6C
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	movs r3, #0x80
	lsls r3, r3, #5
	adds r2, r3, #0
	adds r0, r0, r2
	lsls r6, r0, #0x10
	lsrs r2, r6, #0x10
	mov r0, r8
	bl j_TmApplyTsa
	movs r5, #0
	cmp r5, r7
	bge _08097462
	mov r4, r8
	adds r4, #0x40
	adds r5, r7, #0
_0809744E:
	adds r0, r4, #0
	ldr r1, _08097490 @ =0x08A96C84
	lsrs r2, r6, #0x10
	bl j_TmApplyTsa
	adds r4, #0x80
	subs r5, #1
	cmp r5, #0
	bne _0809744E
	adds r5, r7, #0
_08097462:
	lsls r0, r5, #7
	add r0, r8
	adds r0, #0x40
	ldr r1, _08097494 @ =0x08A96CC4
	mov r4, sl
	lsls r2, r4, #0xc
	mov r4, sb
	lsls r3, r4, #0xf
	lsrs r3, r3, #0x14
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl j_TmApplyTsa
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809748C: .4byte 0x08A96C6C
_08097490: .4byte 0x08A96C84
_08097494: .4byte 0x08A96CC4

