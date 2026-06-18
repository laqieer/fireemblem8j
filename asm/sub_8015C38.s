	.syntax unified
	.section .text.sub_8015C38, "ax", %progbits
@ CamMove_OnInit @ JP 0x08015C38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CamMove_OnInit
	.thumb_func
CamMove_OnInit:
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	movs r5, #1
	movs r0, #0x2c
	ldrsh r2, [r3, r0]
	movs r1, #0x30
	ldrsh r0, [r3, r1]
	subs r1, r2, r0
	cmp r1, #0
	bge _08015C4E
	subs r1, r0, r2
_08015C4E:
	movs r2, #0x2e
	ldrsh r4, [r3, r2]
	movs r2, #0x32
	ldrsh r0, [r3, r2]
	subs r2, r4, r0
	cmp r2, #0
	bge _08015C5E
	subs r2, r0, r4
_08015C5E:
	cmp r1, r2
	ble _08015C6C
	adds r0, r3, #0
	adds r0, #0x40
	strb r5, [r0]
	strh r1, [r3, #0x38]
	b _08015C76
_08015C6C:
	adds r1, r3, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	strh r2, [r3, #0x38]
_08015C76:
	movs r0, #0x38
	ldrsh r2, [r3, r0]
	movs r4, #0
	asrs r0, r5, #1
	subs r0, r2, r0
	ldr r6, _08015C8C @ =0x0202BD40
	cmp r0, #0
	bge _08015C90
	strb r2, [r6]
	b _08015CB0
	.align 2, 0
_08015C8C: .4byte 0x0202BD40
_08015C90:
	asrs r1, r5, #1
	subs r2, r2, r1
	adds r0, r4, r6
	strb r1, [r0]
	cmp r5, #0xf
	bgt _08015CA2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
_08015CA2:
	adds r4, #1
	asrs r0, r5, #1
	subs r0, r2, r0
	cmp r0, #0
	bge _08015C90
	adds r0, r4, r6
	strb r2, [r0]
_08015CB0:
	str r4, [r3, #0x3c]
	ldrh r0, [r3, #0x38]
	strh r0, [r3, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

