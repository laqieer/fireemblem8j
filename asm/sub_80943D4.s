	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8012414, 0x08012414 + 1
	.section .text.sub_80943D4, "ax", %progbits
@ sub_80943D4 @ JP 0x080943D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80943D4
	.thumb_func
sub_80943D4:
	push {r4, lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _080943EC
	ldr r0, _080943E8 @ =0x08A9360C
	movs r1, #3
	bl sub_8002BCC
	b _080943F2
	.align 2, 0
_080943E8: .4byte 0x08A9360C
_080943EC:
	ldr r0, _08094410 @ =0x08A9360C
	bl Proc_StartBlocking
_080943F2:
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x39
	movs r0, #1
	strb r0, [r1]
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08094414
	adds r1, r4, #0
	adds r1, #0x3a
	movs r0, #5
	b _0809441C
	.align 2, 0
_08094410: .4byte 0x08A9360C
_08094414:
	bl sub_8012414
	adds r1, r4, #0
	adds r1, #0x3a
_0809441C:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x3b
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

