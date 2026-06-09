	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set MakeBgmOverridePersist, 0x0800265C + 1
	.set sub_800223C, 0x0800223C + 1
	.set sub_8002570, 0x08002570 + 1
	.set sub_80BEE54, 0x080BEE54 + 1
	.section .text.sub_809EF34, "ax", %progbits
@ sub_809EF34 @ JP 0x0809EF34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809EF34
	.thumb_func
sub_809EF34:
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #1
	bl sub_800223C
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EF50
	movs r0, #0x38
	bl sub_8002570
	b _0809EF72
_0809EF50:
	ldr r0, _0809EF68 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EF6C
	bl MakeBgmOverridePersist
	bl sub_80BEE54
	b _0809EF72
	.align 2, 0
_0809EF68: .4byte 0x03005270
_0809EF6C:
	movs r0, #0x34
	bl sub_8002570
_0809EF72:
	pop {r0}
	bx r0
	.align 2, 0

