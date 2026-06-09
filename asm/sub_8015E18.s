	.syntax unified
	.set GetCameraAdjustedX, 0x080159D4 + 1
	.set GetCameraAdjustedY, 0x08015A18 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8015E18, "ax", %progbits
@ sub_8015E18 @ JP 0x08015E18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015E18
	.thumb_func
sub_8015E18:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov sb, r2
	lsls r0, r1, #4
	bl GetCameraAdjustedX
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, sb
	lsls r0, r1, #4
	bl GetCameraAdjustedY
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, _08015E60 @ =0x0202BCAC
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r7, r0
	bne _08015E4E
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r6, r0
	beq _08015E5A
_08015E4E:
	ldr r4, _08015E64 @ =0x085C29C8
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08015E68
_08015E5A:
	movs r0, #0
	b _08015E98
	.align 2, 0
_08015E60: .4byte 0x0202BCAC
_08015E64: .4byte 0x085C29C8
_08015E68:
	cmp r5, #0
	beq _08015E76
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08015E7E
_08015E76:
	adds r0, r4, #0
	movs r1, #3
	bl sub_8002BCC
_08015E7E:
	adds r2, r0, #0
	ldr r0, _08015EA4 @ =0x0202BCAC
	ldrh r1, [r0, #0xc]
	strh r1, [r2, #0x30]
	ldrh r0, [r0, #0xe]
	strh r0, [r2, #0x32]
	strh r7, [r2, #0x2c]
	strh r6, [r2, #0x2e]
	mov r0, r8
	strh r0, [r2, #0x34]
	mov r1, sb
	strh r1, [r2, #0x36]
	movs r0, #1
_08015E98:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015EA4: .4byte 0x0202BCAC

