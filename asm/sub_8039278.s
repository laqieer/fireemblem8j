	.syntax unified
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8000CE4, 0x08000CE4 + 1
	.set sub_8037FDC, 0x08037FDC + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_8039278, "ax", %progbits
@ sub_8039278 @ JP 0x08039278 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8039278
	.thumb_func
sub_8039278:
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _080392B0 @ =0x03001798
	ldr r2, _080392B4 @ =0x04000003
	mov r1, sp
	bl sub_80D6370
	bl sub_8000CD8
	adds r4, r0, #0
	ldr r0, _080392B8 @ =0x020038C4
	ldr r0, [r0]
	bl sub_8000CE4
	mov r0, sp
	bl sub_8037FDC
	adds r0, r4, #0
	bl sub_8000CE4
	cmp r5, #4
	bhi _0803930A
	lsls r0, r5, #2
	ldr r1, _080392BC @ =_080392C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080392B0: .4byte 0x03001798
_080392B4: .4byte 0x04000003
_080392B8: .4byte 0x020038C4
_080392BC: .4byte _080392C0
_080392C0: @ jump table
	.4byte _080392D4 @ case 0
	.4byte _080392E6 @ case 1
	.4byte _080392EC @ case 2
	.4byte _080392F2 @ case 3
	.4byte _08039302 @ case 4
_080392D4:
	mov r0, sp
	ldrh r2, [r0, #6]
	lsrs r2, r2, #3
	ldrb r0, [r0, #8]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #0xd
	orrs r0, r2
	b _0803930C
_080392E6:
	mov r0, sp
	ldrh r0, [r0]
	b _0803930C
_080392EC:
	mov r0, sp
	ldrb r0, [r0, #2]
	b _0803930C
_080392F2:
	mov r0, sp
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #8
	orrs r0, r2
	b _0803930C
_08039302:
	ldr r0, [sp, #4]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xe
	b _0803930C
_0803930A:
	movs r0, #0
_0803930C:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1

