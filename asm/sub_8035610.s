	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8019F48, 0x08019F48 + 1
	.set sub_80353E8, 0x080353E8 + 1
	.section .text.sub_8035610, "ax", %progbits
@ sub_8035610 @ JP 0x08035610 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035610
	.thumb_func
sub_8035610:
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08035644 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #1
	beq _0803563C
	ldr r0, _08035648 @ =0x085C6698
	adds r1, r2, #0
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	bl sub_80353E8
	bl sub_8019F48
	ldr r1, _0803564C @ =0x0202BCAC
	ldrh r0, [r1, #0x2a]
	adds r0, #0x10
	strh r0, [r1, #0x2a]
_0803563C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035644: .4byte 0x0202BCEC
_08035648: .4byte 0x085C6698
_0803564C: .4byte 0x0202BCAC

