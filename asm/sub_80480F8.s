	.syntax unified
	.set BMapVSync_Start, 0x080300A0 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetBmStLinkArenaFlag, 0x08042DFC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.set sub_804A4A0, 0x0804A4A0 + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_80A9C30, 0x080A9C30 + 1
	.set sub_80AAF78, 0x080AAF78 + 1
	.section .text.sub_80480F8, "ax", %progbits
@ sub_80480F8 @ JP 0x080480F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80480F8
	.thumb_func
sub_80480F8:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_804F8F4
	ldr r0, _08048160 @ =0x0203DB60
	ldr r1, _08048164 @ =0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl sub_8003BE8
	movs r0, #5
	bl sub_80A9C30
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804811C
	bl sub_80AAF78
_0804811C:
	ldr r1, _08048168 @ =0x0203DA20
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	bl SetBmStLinkArenaFlag
	bl sub_804A4A0
	bl BMapVSync_Start
	ldr r1, _0804816C @ =0x0202BCEC
	ldrb r2, [r1, #0x14]
	movs r0, #0xdf
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	ldrb r2, [r1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _08048170 @ =0x085D3D90
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r0, _08048174 @ =0x085C2EDC
	movs r1, #3
	bl sub_8002BCC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048160: .4byte 0x0203DB60
_08048164: .4byte 0x06001800
_08048168: .4byte 0x0203DA20
_0804816C: .4byte 0x0202BCEC
_08048170: .4byte 0x085D3D90
_08048174: .4byte 0x085C2EDC

