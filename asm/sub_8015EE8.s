	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8015EE8, "ax", %progbits
@ sub_8015EE8 @ JP 0x08015EE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015EE8
	.thumb_func
sub_8015EE8:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08015F0C @ =0x0202BCAC
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _08015F06
	ldr r4, _08015F10 @ =0x085C29C8
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08015F14
_08015F06:
	movs r0, #0
	b _08015F40
	.align 2, 0
_08015F0C: .4byte 0x0202BCAC
_08015F10: .4byte 0x085C29C8
_08015F14:
	cmp r5, #0
	beq _08015F22
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08015F2A
_08015F22:
	adds r0, r4, #0
	movs r1, #3
	bl sub_8002BCC
_08015F2A:
	adds r2, r0, #0
	ldr r1, _08015F48 @ =0x0202BCAC
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0x32]
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x2c]
	ldrh r0, [r1, #0x2a]
	strh r0, [r2, #0x2e]
	movs r0, #1
_08015F40:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08015F48: .4byte 0x0202BCAC

